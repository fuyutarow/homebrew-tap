class Agx < Formula
  version "5.0.0"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v5.0.0/agx-5.0.0-darwin-arm64.tar.gz"
      sha256 "a9c754b9d6a6713a8cafa59bc4c3bf7e54c7be18508eb44e22be26223d205733"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v5.0.0/agx-5.0.0-darwin-x64.tar.gz"
      sha256 "41c61407183672185283b7db70a05179779b93faa25f4f26be96153b6ba839f5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v5.0.0/agx-5.0.0-linux-arm64.tar.gz"
      sha256 "5428b982c0cbae506093fb7bbad582d2bcf5a162d968059b501f9f972211bdf6"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v5.0.0/agx-5.0.0-linux-x64.tar.gz"
      sha256 "3f6dd7b1197dad8c382483c7ccf23521de236d9b516ed6b1910bbc6222e4a1ac"
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
