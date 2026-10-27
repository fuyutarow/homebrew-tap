class Agx < Formula
  version "1.19.0"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.19.0/agx-1.19.0-darwin-arm64.tar.gz"
      sha256 "1c53dd81846a29a6b9c73edcde29aceb084f3f67d909a0383fd4a021fe0f9b89"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.19.0/agx-1.19.0-darwin-x64.tar.gz"
      sha256 "e659f8798a7834842dbdf441ceed8cb9559ca86e7eb57d801fafcd03a77fb73c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.19.0/agx-1.19.0-linux-arm64.tar.gz"
      sha256 "76defb116258ecf967d3cb7c828e839efdf6d1e396fa8438a7a79b8e43dc8433"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.19.0/agx-1.19.0-linux-x64.tar.gz"
      sha256 "40324b7052bfaea803eb05d5c5edce7557b1760cfdd3ac86bab4d2d2edd44711"
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
