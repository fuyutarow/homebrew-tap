class Agx < Formula
  version "1.22.90"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.90/agx-1.22.90-darwin-arm64.tar.gz"
      sha256 "c428073e80237ca5d536d4cdbc62bb59377f7a261cdbafb2b085cb3db450ac22"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.90/agx-1.22.90-darwin-x64.tar.gz"
      sha256 "5827877b713a48d5636418ea5b87dfb331d3f13eac631d3ce3398e587bd99a98"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.90/agx-1.22.90-linux-arm64.tar.gz"
      sha256 "4f77d8eb6ec576e29de3ea7752f17b107a29d6fb1c39ce9f3ffb490c2b5a3387"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.90/agx-1.22.90-linux-x64.tar.gz"
      sha256 "034a30004dc08c9d46932e8cc462f19c3e67d86b79a57ea12bc6f6c0aa785780"
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
