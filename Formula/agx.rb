class Agx < Formula
  version "2.0.1"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v2.0.1/agx-2.0.1-darwin-arm64.tar.gz"
      sha256 "0df2928c22434165828a0b86594e8404acf52e03f044666499dfe26d75e49d3b"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v2.0.1/agx-2.0.1-darwin-x64.tar.gz"
      sha256 "d8ae90fb3db16b1d134d370909f492d5c17a10c919bca8952deda5c9824afb68"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v2.0.1/agx-2.0.1-linux-arm64.tar.gz"
      sha256 "421ea730c4d31095e38a8202d8bc33ec737d1888285d68aa35083148e30d6f90"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v2.0.1/agx-2.0.1-linux-x64.tar.gz"
      sha256 "a2569d7379a33459bb90ad71da4fbcf1ab0d7d1f6549e8ba70a8ea30aa788488"
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
