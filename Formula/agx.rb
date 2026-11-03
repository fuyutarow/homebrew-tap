class Agx < Formula
  version "1.22.78"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.78/agx-1.22.78-darwin-arm64.tar.gz"
      sha256 "3b53d0ceac3f8bc448e8f0b7a77062cda62c81b5c3aff34ecea6c56ac6b89684"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.78/agx-1.22.78-darwin-x64.tar.gz"
      sha256 "3454e4e9f9f515ea2a2194d60bccd5b6368fb2cc92ad7b3d0939ab19794ba0d8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.78/agx-1.22.78-linux-arm64.tar.gz"
      sha256 "023ef63d876f50045a5d2aab46e6db90d3748d10d4607fdf1fafcec099d12fcc"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.78/agx-1.22.78-linux-x64.tar.gz"
      sha256 "8123513a3e663b406d8ae4e460327ab2c47658b82622dde840c66fb16552c32f"
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
