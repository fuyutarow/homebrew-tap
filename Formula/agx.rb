class Agx < Formula
  version "1.22.72"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.72/agx-1.22.72-darwin-arm64.tar.gz"
      sha256 "0871d3e32962f777fbc997236e990041640d59e9c0d8c226d18e8b4719d80f84"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.72/agx-1.22.72-darwin-x64.tar.gz"
      sha256 "4bc1b8857366c4196f768338d7221ff0d68ead4a239aeb194a399508ed52fe1a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.72/agx-1.22.72-linux-arm64.tar.gz"
      sha256 "e0ec3c84263d3d233baf45d6374cc99aeb57d1a8d7776a04828a2a27651b09a6"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.72/agx-1.22.72-linux-x64.tar.gz"
      sha256 "70b587563f09337839d5052296d087225b90dd0d207e432030a4c2fdd03577b5"
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
