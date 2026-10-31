class Agx < Formula
  version "1.22.53"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.53/agx-1.22.53-darwin-arm64.tar.gz"
      sha256 "a447bfd8a005abc3868a3cacac666ea399a44ae6c31fdec1c1b4261a99ed5a80"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.53/agx-1.22.53-darwin-x64.tar.gz"
      sha256 "ce1b150512863bbd8070cca87c5a09ce653172eefdbf4ed56ee5c9d6a87b9fa6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.53/agx-1.22.53-linux-arm64.tar.gz"
      sha256 "f77e8d0bae5b568d80f1b91f07fbe4d6a9712c0c551f3579c5c1f2f55dc5ae58"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.53/agx-1.22.53-linux-x64.tar.gz"
      sha256 "29f30a610a353c5d64d9934279bf38b49c57d1c86c55256df34d7a60caf37296"
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
