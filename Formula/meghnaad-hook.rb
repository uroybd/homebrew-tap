class MeghnaadHook < Formula
  desc "Your Meghnaad Lua hooks script, as hooks for the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.6.83"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.83/meghnaad-hook-0.6.83-aarch64-apple-darwin.tar.gz"
      sha256 "ae7ef657475efb8ea1448bb01a4f96d65d89aa66012372368d5be9d630199190"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.83/meghnaad-hook-0.6.83-x86_64-apple-darwin.tar.gz"
      sha256 "9978e33a0ed4654397a0f80e1331cd0f2ad663387159ae8017ec2324754d581c"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.83/meghnaad-hook-0.6.83-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6d506c9051922337ea79301a8aa8bb14b9dae9faf06298836cee7fc141242a07"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.83/meghnaad-hook-0.6.83-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6ca814e740468d7653d85ab054f6818a71caf36e561a74aa69c7352bb3ccaef2"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.6.83/docs/using/hooks.md#the-same-script-with-the-real-task
    EOS
  end

  test do
    (testpath/"hooks.lua").write "function on_add(task) end"
    assert_match "defines on_add", shell_output("#{bin}/meghnaad-hook check #{testpath}/hooks.lua")
  end
end
