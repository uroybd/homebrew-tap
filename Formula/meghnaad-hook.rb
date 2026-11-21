class MeghnaadHook < Formula
  desc "Your Meghnaad Lua hooks script, as hooks for the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.37"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.37/meghnaad-hook-0.8.37-aarch64-apple-darwin.tar.gz"
      sha256 "5505cf30234d12b369f523c1e5d28e2879f22b366940008edaca255b69a5aea9"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.37/meghnaad-hook-0.8.37-x86_64-apple-darwin.tar.gz"
      sha256 "df07554451b634df3fb079d98cb3435ad7289e4af8aed7ffd743a78e16dbf43b"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.37/meghnaad-hook-0.8.37-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "18a30184dfa4a1de950902b66235a36775837cb9997d53351f4b7ef7d27d915e"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.37/meghnaad-hook-0.8.37-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "214fa0f1d7592ee72abf8b130cf49495f28a1c85cf0832d4281eecd434fa7303"
    end
  end

  def install
    bin.install "meghnaad-hook"
  end

  def caveats
    <<~EOS
      Point task at your script, once (and again when it defines a hook it did not before):
        meghnaad-hook check ~/hooks.lua
        meghnaad-hook install ~/hooks.lua
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.37/docs/using/hooks.md#the-same-script-with-the-real-task
    EOS
  end

  test do
    (testpath/"hooks.lua").write "function on_add(task) end"
    assert_match "defines on_add", shell_output("#{bin}/meghnaad-hook check #{testpath}/hooks.lua")
  end
end
