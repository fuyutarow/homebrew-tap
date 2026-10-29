class Agx < Formula
  version "1.22.31"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.31/agx-1.22.31-darwin-arm64.tar.gz"
      sha256 "293eb926be2ed5578a2f214252b9841e96dbdeb0a52ef5110a46952233bb272a"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.31/agx-1.22.31-darwin-x64.tar.gz"
      sha256 "bef706f5a340c177b2f1c98090993c96e61bfbcb492e67c635f5091d6def5c37"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.31/agx-1.22.31-linux-arm64.tar.gz"
      sha256 "5e594087c2b3677aa55ec1763fd0840a2f36cf7601d45a07c75aa763b8a3556d"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.31/agx-1.22.31-linux-x64.tar.gz"
      sha256 "3219dde67111cdf80be573498129442abe7d366ec0c095461a33d6b08cd0b499"
    end
  end

  def install
    executables = Dir["*"].select { |path| File.file?(path) && File.executable?(path) }
    if executables.empty?
      executables = Dir["bin/*"].select { |path| File.file?(path) && File.executable?(path) }
    end
    raise "no executables found in archive" if executables.empty?

    bin.install executables.reject { |path| File.basename(path) == "xmsg" }
    bin.install_symlink "agx-msg" => "xmsg"
  end

  test do
    assert_equal "agx #{version}", shell_output("#{bin}/agx -V").strip
  end
end
