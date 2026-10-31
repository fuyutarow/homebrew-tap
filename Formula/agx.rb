class Agx < Formula
  version "1.22.55"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.55/agx-1.22.55-darwin-arm64.tar.gz"
      sha256 "b5645023fa4986198b11c8f0890d93f28af352b4778d0a5dd1fe82a581f73c80"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.55/agx-1.22.55-darwin-x64.tar.gz"
      sha256 "4faff90f1cde197c11771aad272543d6d3bbc13c6121c954ed5551fbcac91783"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.55/agx-1.22.55-linux-arm64.tar.gz"
      sha256 "b27017387f7bd0976b95fa3720b5aa716298cac6d9267cd76c865beddbcfcf32"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.55/agx-1.22.55-linux-x64.tar.gz"
      sha256 "19ede734726d5283cd9b4f1e1b53c1ee92dc3dc4de3cd934453fd841f17d6ded"
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
