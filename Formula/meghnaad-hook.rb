class MeghnaadHook < Formula
  desc "Your Meghnaad Lua hooks script, as hooks for the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.6.66"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.66/meghnaad-hook-0.6.66-aarch64-apple-darwin.tar.gz"
      sha256 "5c2e098dda5858a87cb3418311854a349c0e85621425ef46dd021dc3e9a71a56"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.66/meghnaad-hook-0.6.66-x86_64-apple-darwin.tar.gz"
      sha256 "bf4308ced6bc8735b126adfa00553c88859014e8b9c60e1db56667371a399ed4"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.66/meghnaad-hook-0.6.66-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "cd1b9a016fa660a0df8653a5d75bd4b766d255db412d1cfa401b3efdc196421d"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.66/meghnaad-hook-0.6.66-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "44b3caa1190e4554d1aabc786e008cde1d7b9d866c46cbc0fd512b24a62a4502"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.6.66/docs/using/hooks.md#the-same-script-with-the-real-task
    EOS
  end

  test do
    (testpath/"hooks.lua").write "function on_add(task) end"
    assert_match "defines on_add", shell_output("#{bin}/meghnaad-hook check #{testpath}/hooks.lua")
  end
end
