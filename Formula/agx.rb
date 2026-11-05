class Agx < Formula
  version "1.22.103"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.103/agx-1.22.103-darwin-arm64.tar.gz"
      sha256 "99051f0e339310d2093e3a755df7773947ac63152a7ae6d3fa20bab510f98c47"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.103/agx-1.22.103-darwin-x64.tar.gz"
      sha256 "b1d1ee95e640003d8b8461fad996169db5c9e0d7aca8e505a3bd97f885fb35fb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.103/agx-1.22.103-linux-arm64.tar.gz"
      sha256 "0ad1d8550564e83630064a8f1c72e09f37adcad8872b3e50257a94658530dc76"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.103/agx-1.22.103-linux-x64.tar.gz"
      sha256 "aa9353d65dfb63e28648a73648d58be5cf8324fe800b36bcd195b551e245c03c"
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
