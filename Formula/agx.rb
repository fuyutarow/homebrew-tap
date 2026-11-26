class Agx < Formula
  version "11.4.0"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v11.4.0/agx-11.4.0-darwin-arm64.tar.gz"
      sha256 "4a64a11f599ae41e2f4f4f63ef0ea20016f272b41524ed81a3b4dad7e3dd3350"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v11.4.0/agx-11.4.0-darwin-x64.tar.gz"
      sha256 "cc1a0b08570d543a14fc44777f511399ae8a34717224da44b780087c9ca38e1c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v11.4.0/agx-11.4.0-linux-arm64.tar.gz"
      sha256 "cfef0af45a28d3109b55350e7ba98dbae658f139c676d3d1dc62c2a5a672e50a"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v11.4.0/agx-11.4.0-linux-x64.tar.gz"
      sha256 "ce555007193987194179f7bc1ddac32f78df5d746f92d52ccd43b49d9015ffd2"
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
