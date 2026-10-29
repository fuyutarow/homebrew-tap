class Agx < Formula
  version "1.22.34"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.34/agx-1.22.34-darwin-arm64.tar.gz"
      sha256 "ec9abc977328ead3fbaae76882cd77c33d44efa1a871a62f8d4bb85d7e0b9d2d"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.34/agx-1.22.34-darwin-x64.tar.gz"
      sha256 "7e27eef0621715db30e902eae0efda64d83947caec17dd88c16cfe6a38d365fb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.34/agx-1.22.34-linux-arm64.tar.gz"
      sha256 "ce43594a402a86e905e3f385b1465603d0a0ec85cefea076a4e45e6aff4495ba"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.34/agx-1.22.34-linux-x64.tar.gz"
      sha256 "627daa5b0aa29dab167c32516d272ab7356e39054dc083bae40f9341a8a17cd6"
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
