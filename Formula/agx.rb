class Agx < Formula
  version "3.0.0"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v3.0.0/agx-3.0.0-darwin-arm64.tar.gz"
      sha256 "2e574795cb6ade7f4f73c4af5a85474aa4eeca10b7351365150f3d4039d16615"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v3.0.0/agx-3.0.0-darwin-x64.tar.gz"
      sha256 "cecf4a77d44b059ec2a027329357effb947ecfa4f31c0c3fa4c6f982a9543986"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v3.0.0/agx-3.0.0-linux-arm64.tar.gz"
      sha256 "e24a81a8a1278987312323a4804747568cea96698395368d7700d7deed398cc0"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v3.0.0/agx-3.0.0-linux-x64.tar.gz"
      sha256 "63848e3f10408d739a732ab6a879838d393f0749887c22ff7ce9ecdb41c70c74"
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
