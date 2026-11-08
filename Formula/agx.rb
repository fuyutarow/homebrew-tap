class Agx < Formula
  version "5.5.0"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v5.5.0/agx-5.5.0-darwin-arm64.tar.gz"
      sha256 "fe7c19ba05f4a536efb80bee745feff2e84bc5ccf08356370be660ef043cab63"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v5.5.0/agx-5.5.0-darwin-x64.tar.gz"
      sha256 "d1fcfe2c700d3e5e736c12749b2ee4561c8028f19052be484fcd7c890e76eb9b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v5.5.0/agx-5.5.0-linux-arm64.tar.gz"
      sha256 "2528beef30ed64c06ffe2d5704ede81c1a4b9ea3e003be47faa7c615d58a0f6c"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v5.5.0/agx-5.5.0-linux-x64.tar.gz"
      sha256 "795e84a45c1584fc52c82e022afaca15462d7ec27b420fffbf0e2fa6149a0d7c"
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
