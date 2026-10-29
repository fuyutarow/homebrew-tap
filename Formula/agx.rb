class Agx < Formula
  version "1.22.17"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.17/agx-1.22.17-darwin-arm64.tar.gz"
      sha256 "63b2c8811ed7de7da40190f73c33c473338cd8affdc78feea2b137bb7381c0ed"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.17/agx-1.22.17-darwin-x64.tar.gz"
      sha256 "b896581cc9a4bb990d9326e8814561c7e3e106ba48ede3c9e3f7752cede40162"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.17/agx-1.22.17-linux-arm64.tar.gz"
      sha256 "d5681b6302eb5ad1eed09e4a146f5ee025a7812380d49bb83e3b8c7d0c82ea0d"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.17/agx-1.22.17-linux-x64.tar.gz"
      sha256 "e84ef1691df05fc264caac6a5e6584a9e346d58d394de7b9023d9439b7a04a80"
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
