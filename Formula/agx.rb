class Agx < Formula
  version "1.13.7"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.13.7/agx-1.13.7-darwin-arm64.tar.gz"
      sha256 "98886eba7b285709e41e4b3f5056ef2d815d9b71823154e1daeb96d596f715b8"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.13.7/agx-1.13.7-darwin-x64.tar.gz"
      sha256 "76d4545c8d7b0ee92251f420c9286cac46360acf677521bdaeebe53985d0319e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.13.7/agx-1.13.7-linux-arm64.tar.gz"
      sha256 "2ae71d416c11c6ff478a2e145ac3efc7dcdea4000f8082adf826234e5369a56b"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.13.7/agx-1.13.7-linux-x64.tar.gz"
      sha256 "bf0e58223f4d5820855ec7de05af373494ebb233d05b034adc22dfb8571275df"
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
