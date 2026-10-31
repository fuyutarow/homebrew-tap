class Agx < Formula
  version "1.22.58"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.58/agx-1.22.58-darwin-arm64.tar.gz"
      sha256 "90c5dd55c96383448c23d2ecf3f56db5c20c2ba4b7af2e597a337655b46c94aa"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.58/agx-1.22.58-darwin-x64.tar.gz"
      sha256 "2efad2b4ffabf450e814f0973f0402b28f8e351823daeb96574d8b83c56f2ac5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.58/agx-1.22.58-linux-arm64.tar.gz"
      sha256 "8f1f1d54eb906b02e331f1e61e251309175a54f44af4a534f3fb6b8b69286f26"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.58/agx-1.22.58-linux-x64.tar.gz"
      sha256 "56e0b70e879f129c7b614c7d690d6524ddac8cc5f3534cd0c6f3f9c5cd7021e4"
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
