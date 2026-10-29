class Agx < Formula
  version "1.22.9"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.9/agx-1.22.9-darwin-arm64.tar.gz"
      sha256 "c7b1b2d46dfc8996f7f012fdad54f767d6f4f3c332794045d8dc217cdbf91421"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.9/agx-1.22.9-darwin-x64.tar.gz"
      sha256 "ed6f9f24dd455186401f0bcf02687825d4ae844f7c1a6f3c1f854535be03b6a8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.9/agx-1.22.9-linux-arm64.tar.gz"
      sha256 "7d50f598eca260e2548e8213aad4e8936d381557c49e77de9db9d51c54d96a57"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.9/agx-1.22.9-linux-x64.tar.gz"
      sha256 "c5d9a6e44f49b441e1c69dfb5973bd53c30b7910e5e9e76b3853cabad5e2448c"
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
