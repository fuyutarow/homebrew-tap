class Agx < Formula
  version "1.22.106"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.106/agx-1.22.106-darwin-arm64.tar.gz"
      sha256 "084bf460b1fa92c1a38dc48d58cea985a29882dcaddc691330b038bc6a9806a3"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.106/agx-1.22.106-darwin-x64.tar.gz"
      sha256 "3be6201d4bd80492e8786d715be2d3d8007b3490eb7171b7176a4af29d414d84"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.106/agx-1.22.106-linux-arm64.tar.gz"
      sha256 "0bb9adc57e0fe95a7874cdd3ad689137f22b411ebbc04d8dc5eeb91d65207147"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.106/agx-1.22.106-linux-x64.tar.gz"
      sha256 "f05b49d2fdf7bcc02797521487b465aef123903a5a5f34a713248112a97eb2e3"
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
