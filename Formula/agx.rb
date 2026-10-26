class Agx < Formula
  version "1.14.7"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.14.7/agx-1.14.7-darwin-arm64.tar.gz"
      sha256 "04fb0a94c95b206327d2f07564f10417a6fd32d7730d0635e3491db636c44734"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.14.7/agx-1.14.7-darwin-x64.tar.gz"
      sha256 "a52c8d109af0a4a2c24111eb07ea5fb1fef0ed49568f8c3cbc34fd3a11ca33fa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.14.7/agx-1.14.7-linux-arm64.tar.gz"
      sha256 "8f9bb00161be36628d24cfe807efc70964e4880d6468ea6d446e3083fea15e05"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.14.7/agx-1.14.7-linux-x64.tar.gz"
      sha256 "0109017aeba032e9a8d383ef9423c55de4390af8057f678c3bdae735f4c48ab5"
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
