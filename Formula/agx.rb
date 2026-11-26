class Agx < Formula
  version "11.5.0"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v11.5.0/agx-11.5.0-darwin-arm64.tar.gz"
      sha256 "f063abaf9bcca269b447b65546abfe11179285621fda409eea89c76095e1d8eb"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v11.5.0/agx-11.5.0-darwin-x64.tar.gz"
      sha256 "cdd4756ff03d1486c37c5fb049d4ae54d4dae7b3986fca6c5d2a9557f41e6020"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v11.5.0/agx-11.5.0-linux-arm64.tar.gz"
      sha256 "1e5b89c738c55ae6ee1cb8b0c9f6caef385abe44f0e1ac89f03a99f51d882f68"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v11.5.0/agx-11.5.0-linux-x64.tar.gz"
      sha256 "5cf84b3a6df77f2bb0b106e11c938fd79e327aa995533a0082dcfa3202094d03"
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
