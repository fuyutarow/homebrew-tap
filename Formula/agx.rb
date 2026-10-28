class Agx < Formula
  version "1.21.5"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.21.5/agx-1.21.5-darwin-arm64.tar.gz"
      sha256 "1c9341a9da648553d4b9e99bf4caed4603c98e7ddd3a28541ce98ac74851e193"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.21.5/agx-1.21.5-darwin-x64.tar.gz"
      sha256 "10bbe594d3d7b6167b32a3a0aa93ea2fcc7a92c31dea0f1e67744f106842f4d5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.21.5/agx-1.21.5-linux-arm64.tar.gz"
      sha256 "86c739ad6080caeb25a468039d354a61e2936391e59a964f39f68a706392a4c6"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.21.5/agx-1.21.5-linux-x64.tar.gz"
      sha256 "01be0e7a1205e2356b947a66b1cced08bccf9686878cb6ea84992c91d6035dd3"
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
