class Agx < Formula
  version "8.0.1"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v8.0.1/agx-8.0.1-darwin-arm64.tar.gz"
      sha256 "8d4073887cb0df7d18b8a097f3e85640f2169f5377e421b098885d6dfeed568b"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v8.0.1/agx-8.0.1-darwin-x64.tar.gz"
      sha256 "d0a8630f70e573453c0df0eeb0166dcc768f206534d47819bc9a4903f9bd5e78"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v8.0.1/agx-8.0.1-linux-arm64.tar.gz"
      sha256 "d6667329e6ab80fa51aa934349e07ec790aab94ce1ff4eab56cbc318618e0902"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v8.0.1/agx-8.0.1-linux-x64.tar.gz"
      sha256 "c8c1dd7006e59181aaea0ad9f78d2d6a899b132b2f901aaafaa427990a65149e"
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
