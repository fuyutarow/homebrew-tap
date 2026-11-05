class Agx < Formula
  version "1.22.107"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.107/agx-1.22.107-darwin-arm64.tar.gz"
      sha256 "84f20eb526675ff62f2afb7bb42b64e7a4065dea3b42234fa8d291d63774ec6e"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.107/agx-1.22.107-darwin-x64.tar.gz"
      sha256 "00f94214ae567ae6ee89cee48f3c90fb6df9830211ceec4fbb5c0c6590a37c8f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.107/agx-1.22.107-linux-arm64.tar.gz"
      sha256 "96783fdc57cef1645eb4e378784bf5690c65d275492af58fda05901f56d3ab5e"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.107/agx-1.22.107-linux-x64.tar.gz"
      sha256 "31ef25a9360266d666329cb45f2d643bbd3f14f31f7e7354e412c7b1e0e49416"
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
