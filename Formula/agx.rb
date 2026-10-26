class Agx < Formula
  version "1.14.8"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.14.8/agx-1.14.8-darwin-arm64.tar.gz"
      sha256 "d175b35e05c3b4e951af3943c16117ba255c93f74130be3d40e3a2ee05ba49ea"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.14.8/agx-1.14.8-darwin-x64.tar.gz"
      sha256 "be7b67592e4451470cb65c8147bd8a7737f113b28c4df8485af147b854bd0fdf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.14.8/agx-1.14.8-linux-arm64.tar.gz"
      sha256 "c94aaae9d7499f0257cf50f59b54af4a706cb1dc7579617038b4fb0fe29a1afa"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.14.8/agx-1.14.8-linux-x64.tar.gz"
      sha256 "3c511265b60a23abd55e96c99ba3e32e02c85beea573724e0166e0dbc2de24d6"
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
