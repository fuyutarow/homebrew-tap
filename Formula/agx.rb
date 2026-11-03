class Agx < Formula
  version "1.22.75"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.75/agx-1.22.75-darwin-arm64.tar.gz"
      sha256 "2ab425bbe20fcb6d12efebeb2df565901acaacf65ce31dde448cefd1c2788b08"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.75/agx-1.22.75-darwin-x64.tar.gz"
      sha256 "8f3e4c4f8bf36b25ea0b72f4301dbdc44f3a4dda1f6ca6b11ed8e9fc3105ffc3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.75/agx-1.22.75-linux-arm64.tar.gz"
      sha256 "1fcf600c31af16bd0ad392fc35a4d8af6fc66e5a000e42e0fd411b7feb240eb3"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.75/agx-1.22.75-linux-x64.tar.gz"
      sha256 "a342424a5f8c632f13525dbc7489c0001d8647b5565e6aad7146b8e657213b45"
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
