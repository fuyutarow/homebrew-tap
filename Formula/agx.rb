class Agx < Formula
  version "1.22.37"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.37/agx-1.22.37-darwin-arm64.tar.gz"
      sha256 "20c296618bfd8a549ea4e4b13388355a7c1b275807f3172b295f8707fd9fc6dd"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.37/agx-1.22.37-darwin-x64.tar.gz"
      sha256 "93c9cd8488a67fea2fd1c0462ae3c0dd8a51392050bf655bdfec9f0d6a518817"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.37/agx-1.22.37-linux-arm64.tar.gz"
      sha256 "a1cda60addbdd1dd623f4268f890e364e6292fabd7865fe160ea18ffdeed8616"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.37/agx-1.22.37-linux-x64.tar.gz"
      sha256 "541dab1b4424cdfc47a36f366a71c60e58b4f960715bc304487425614bbcf877"
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
