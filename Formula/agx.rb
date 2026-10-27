class Agx < Formula
  version "1.20.0"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.20.0/agx-1.20.0-darwin-arm64.tar.gz"
      sha256 "0d56a04a1dcaf9a26646b7b5e389725cd75aab2ca162a1d79cea89ec87fe7deb"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.20.0/agx-1.20.0-darwin-x64.tar.gz"
      sha256 "eb1253d6b70ef7f329bffdc38a9c4e44175fb3a0f891dc0bbc8e5fb87bd6856f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.20.0/agx-1.20.0-linux-arm64.tar.gz"
      sha256 "4798cc291f6cc54f6c902d623a53d9e0848e5988a8fad272291a14c93db66d14"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.20.0/agx-1.20.0-linux-x64.tar.gz"
      sha256 "e3b801ef8c6521ec6a8bedbbc0d2baa1fdd8071e06267e11ee241fcb2b4cd163"
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
