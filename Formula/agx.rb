class Agx < Formula
  version "10.0.3"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v10.0.3/agx-10.0.3-darwin-arm64.tar.gz"
      sha256 "df93b52730bd8a66285f377f870685bb65da4758d0d6b66f1a3555253e463458"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v10.0.3/agx-10.0.3-darwin-x64.tar.gz"
      sha256 "e229aa558e5fc3bc3ff96a1b08408f907a66422749e0bc8590000bdf7b7aca25"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v10.0.3/agx-10.0.3-linux-arm64.tar.gz"
      sha256 "0571e532ebb4551b3ccdbb7399a163ca5fa263ca561f0b570aa663bed5f4d2b8"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v10.0.3/agx-10.0.3-linux-x64.tar.gz"
      sha256 "9e116131b94f0714fc87ac47985fe65ba9cffb3d6397d5697ccefe801953e1c0"
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
