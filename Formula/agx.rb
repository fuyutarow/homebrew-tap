class Agx < Formula
  version "1.20.3"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.20.3/agx-1.20.3-darwin-arm64.tar.gz"
      sha256 "0e5a9e751e882344aa7d9d089038adb80331d32988d7bf863ac74ba08b850b98"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.20.3/agx-1.20.3-darwin-x64.tar.gz"
      sha256 "18750ca1b407c0d040033274fa4d240c78cbf64ab2c4b721746e68f4903d5eaf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.20.3/agx-1.20.3-linux-arm64.tar.gz"
      sha256 "d55afefd9d1c962ff5d335c6a7da25a3f4b154ac5b52970e8fb60d5ebde37753"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.20.3/agx-1.20.3-linux-x64.tar.gz"
      sha256 "b09e203a408c95470b270bd535be8e53dceb0735e20b4d4c344d606db065ff94"
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
