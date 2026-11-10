class Agx < Formula
  version "10.0.4"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v10.0.4/agx-10.0.4-darwin-arm64.tar.gz"
      sha256 "a24da18317c71145b3aa933e3863b7ec70bbb6a6a796aebfdc02a5a09b291fa3"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v10.0.4/agx-10.0.4-darwin-x64.tar.gz"
      sha256 "78972ac08a260e22273adea230a27826b7bf216a34d80fbc12af371338d5d4af"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v10.0.4/agx-10.0.4-linux-arm64.tar.gz"
      sha256 "3051702859836a169de6ea6ff9bfad07c733f161b223eff6bbfffcbe6a3658e6"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v10.0.4/agx-10.0.4-linux-x64.tar.gz"
      sha256 "f4e675a4b0e8328c2e1d3dbe796779f2173d09433aba15c410566b3acb1d3313"
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
