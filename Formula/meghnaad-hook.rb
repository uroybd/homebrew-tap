class MeghnaadHook < Formula
  desc "Your Meghnaad Lua hooks script, as hooks for the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.6.81"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.81/meghnaad-hook-0.6.81-aarch64-apple-darwin.tar.gz"
      sha256 "d0efb53044c837172f36a22f061f63010a6dc42adef8811411cf66557c1b5fc6"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.81/meghnaad-hook-0.6.81-x86_64-apple-darwin.tar.gz"
      sha256 "1b4cbdc0a49ba8a3b24e41c87e01dfabc11c4ed498bf87a8d07dafbe6b231734"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.81/meghnaad-hook-0.6.81-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7cb8510be65d977aa39ad79304577d314d4d2a217f16ab86296f6f4daa09831e"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.81/meghnaad-hook-0.6.81-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fc882eee031f4bb1fc3e742942b31013dcc67efdb2f69c764983f47ec43181a2"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.6.81/docs/using/hooks.md#the-same-script-with-the-real-task
    EOS
  end

  test do
    (testpath/"hooks.lua").write "function on_add(task) end"
    assert_match "defines on_add", shell_output("#{bin}/meghnaad-hook check #{testpath}/hooks.lua")
  end
end
