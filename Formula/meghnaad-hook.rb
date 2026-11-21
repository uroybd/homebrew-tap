class MeghnaadHook < Formula
  desc "Your Meghnaad Lua hooks script, as hooks for the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.42"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.42/meghnaad-hook-0.8.42-aarch64-apple-darwin.tar.gz"
      sha256 "43368d666b53463e8c442177dfa1dd303303e570a7c5cde11a33c3c139d8ff5c"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.42/meghnaad-hook-0.8.42-x86_64-apple-darwin.tar.gz"
      sha256 "5b5e7d81b395cf1542c415b4e7c79ff01cab39eedd435b482ac925b65da1b30b"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.42/meghnaad-hook-0.8.42-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2173e8f31bad67035de06543cd773c42411f202935317512921a70bdf39bd152"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.42/meghnaad-hook-0.8.42-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "aefe350a0a03e94e133badbed339ec3d203a816369e88769b4ee8879d1bc1339"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.42/docs/using/hooks.md#the-same-script-with-the-real-task
    EOS
  end

  test do
    (testpath/"hooks.lua").write "function on_add(task) end"
    assert_match "defines on_add", shell_output("#{bin}/meghnaad-hook check #{testpath}/hooks.lua")
  end
end
