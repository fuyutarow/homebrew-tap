class Agx < Formula
  version "1.22.47"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.47/agx-1.22.47-darwin-arm64.tar.gz"
      sha256 "0d6cc9c16cb6797b80d384933b206137f6f90497c19b82a1b2af3a4ec284c1a7"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.47/agx-1.22.47-darwin-x64.tar.gz"
      sha256 "2a4b5ea05ad375820f1d679c0aa50eeea7d5578e9d30d2ae331945ae9837be87"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.47/agx-1.22.47-linux-arm64.tar.gz"
      sha256 "4f6c3ca46ac7abb4dede1db34ce90b0af6dfe754d32240e9f5eb4b271ff2ec69"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.47/agx-1.22.47-linux-x64.tar.gz"
      sha256 "18f38098a7049d0d9c1e519b7a8e902937ca04b6144a463aea8e198a7c962a3e"
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
