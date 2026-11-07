class Agx < Formula
  version "5.2.0"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v5.2.0/agx-5.2.0-darwin-arm64.tar.gz"
      sha256 "fa8a53d10cf7d0670e675579f290c7f8f52eab14e2b6128eaf28271d3105a799"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v5.2.0/agx-5.2.0-darwin-x64.tar.gz"
      sha256 "d99d403bd9d9620874f90ebfafa2ef82f57e11d291c1f7212b70a92d3fb1a89d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v5.2.0/agx-5.2.0-linux-arm64.tar.gz"
      sha256 "bd07bd078bf13d98f17a43206ff534a77d206420fa59876ad495d8159c58dd99"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v5.2.0/agx-5.2.0-linux-x64.tar.gz"
      sha256 "73d4c08c94393bdcde68dc1f15fecc46f568be2a816af6d6dbee8d126e6cf23c"
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
