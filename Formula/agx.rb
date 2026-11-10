class Agx < Formula
  version "10.2.0"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v10.2.0/agx-10.2.0-darwin-arm64.tar.gz"
      sha256 "e0d9096595a22868a17adb1b697a6411d0ccc45e44dc28f25538c0298534ec4e"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v10.2.0/agx-10.2.0-darwin-x64.tar.gz"
      sha256 "978ccfd484b946c815174b6ec7ba50199a239863e010547fba653b5b8df6225a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v10.2.0/agx-10.2.0-linux-arm64.tar.gz"
      sha256 "9c1f6b13761efc8c81783f40799165b59031de3df1ea101cca3a901e5190d040"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v10.2.0/agx-10.2.0-linux-x64.tar.gz"
      sha256 "9b33914b25380e4216e68777b878ec101484c35fc520a7061590d92be568e0a1"
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
