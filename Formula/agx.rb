class Agx < Formula
  version "1.18.0"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.18.0/agx-1.18.0-darwin-arm64.tar.gz"
      sha256 "f0a57aff170cb7de37fc11b1afbb6da52434774dcd0fd87a43f1225f0777633c"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.18.0/agx-1.18.0-darwin-x64.tar.gz"
      sha256 "f66709c1dd3e5b9c8e13a9d6d4f0446b92bae7bf52ac16df12a0cedbf30325cd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.18.0/agx-1.18.0-linux-arm64.tar.gz"
      sha256 "0dadc584f73341165161225cc4a6d05b9adc4ea17881a3a1846e62624f2770b8"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.18.0/agx-1.18.0-linux-x64.tar.gz"
      sha256 "577681851076eed0179b0398ec0511fea1d0ab454a0352a9e660776268f629e3"
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
