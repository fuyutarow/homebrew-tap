class Agx < Formula
  version "1.22.64"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.64/agx-1.22.64-darwin-arm64.tar.gz"
      sha256 "9b93ac12ad992a4c9525d2dcbe80845be3ffa0e6fb4825ace9d338ebb11289be"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.64/agx-1.22.64-darwin-x64.tar.gz"
      sha256 "2dc1abfee7b67d216fe3ccc2ac5001c620877952f9033140cc813ff91f481c36"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.64/agx-1.22.64-linux-arm64.tar.gz"
      sha256 "ce571c74266009928c56ce00db2893edf6c329eb41be6fa06c2f0e8665d60018"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.64/agx-1.22.64-linux-x64.tar.gz"
      sha256 "786c0e9bb00d7648f594269bf9d3e629cde4672183beccf513d1176f66363c3c"
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
