class Agx < Formula
  version "1.13.0"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.13.0/agx-1.13.0-darwin-arm64.tar.gz"
      sha256 "485a7de154313db301418f435adc5b45b3820f51d168fa10351533b14d1e84b2"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.13.0/agx-1.13.0-darwin-x64.tar.gz"
      sha256 "a05575dab9deb50b6275d9e5506772db53eafc239c8eb81c4feb6f055600df22"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.13.0/agx-1.13.0-linux-arm64.tar.gz"
      sha256 "35c974edd9c082bddd1a9d7628ef7aa6fe2085aef004f457c3933c4c94051d1e"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.13.0/agx-1.13.0-linux-x64.tar.gz"
      sha256 "cf053505925c57e7beca0efe1e91b64630b9962786f45b462926b204333bec61"
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
