class Agx < Formula
  version "1.22.97"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.97/agx-1.22.97-darwin-arm64.tar.gz"
      sha256 "2dc9ef94d17281d88cef980778c556d3a19730fd364fd9cda322b2e911fc17b9"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.97/agx-1.22.97-darwin-x64.tar.gz"
      sha256 "312f4ed42be61964b63e064c19144eceea8d93d32aa2d94a69162f442c641fc2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.97/agx-1.22.97-linux-arm64.tar.gz"
      sha256 "cd4a7d0b3fe821ec24e75127e433640ac6a2f6129efb4564ac3b6e90bb927247"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.97/agx-1.22.97-linux-x64.tar.gz"
      sha256 "755ec79a2b5d299579d233ddaa99ff07c7f5df23aa09b6a42bb6fcc26f2046fa"
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
