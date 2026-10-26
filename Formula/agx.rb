class Agx < Formula
  version "1.14.1"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.14.1/agx-1.14.1-darwin-arm64.tar.gz"
      sha256 "7ab9e1a505de6d679d57437ef8822c9c1814889176ddfb073d9a3bd67b5ebb7e"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.14.1/agx-1.14.1-darwin-x64.tar.gz"
      sha256 "a1981b98977acbf6771eac975c78722ee835fba843519fdddb9a3099b02f4e66"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.14.1/agx-1.14.1-linux-arm64.tar.gz"
      sha256 "d166c5fa2122428bcaed451a873dfd5add25f02de7948e2f9431da825d8ba11c"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.14.1/agx-1.14.1-linux-x64.tar.gz"
      sha256 "04e63125b9ac0759304d791c4407bc372db060ee7e9e862bf3948ad3797ac7c6"
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
