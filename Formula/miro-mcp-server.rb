# Homebrew Formula for Miro MCP Server
# Usage: brew tap olgasafonova/tap && brew install miro-mcp-server

class MiroMcpServer < Formula
  desc "Model Context Protocol (MCP) server for Miro whiteboard integration"
  homepage "https://github.com/olgasafonova/miro-mcp-server"
  version "1.14.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/olgasafonova/miro-mcp-server/releases/download/v1.14.0/miro-mcp-server-darwin-amd64"
      sha256 "a46e8c4dbda6adc9e51b080e1ba101cd16d655d5bc2b929e0b748b26a9ded9fe"

      def install
        bin.install "miro-mcp-server-darwin-amd64" => "miro-mcp-server"
      end
    end

    on_arm do
      url "https://github.com/olgasafonova/miro-mcp-server/releases/download/v1.14.0/miro-mcp-server-darwin-arm64"
      sha256 "c9ceb6c98508827a18306b7f44bc8972626584b6aaf74f82762ba18cb4e93afe"

      def install
        bin.install "miro-mcp-server-darwin-arm64" => "miro-mcp-server"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/olgasafonova/miro-mcp-server/releases/download/v1.14.0/miro-mcp-server-linux-amd64"
      sha256 "8b1fabddaa1e8ebdeeedf89b3dea365d3d17b8247b0116020b0dae4e4d729a73"

      def install
        bin.install "miro-mcp-server-linux-amd64" => "miro-mcp-server"
      end
    end
  end

  def caveats
    <<~EOS
      Miro MCP Server has been installed!

      To use it, you need a Miro access token:

      1. Get a token from: https://miro.com/app/settings/user-profile/apps

      2. Configure Claude Code:
         claude mcp add miro-mcp-server -- miro-mcp-server

      3. Set the token as environment variable:
         export MIRO_ACCESS_TOKEN="your_token_here"

      For more information, see:
        https://github.com/olgasafonova/miro-mcp-server#readme
    EOS
  end

  test do
    assert_match "miro-mcp-server", shell_output("#{bin}/miro-mcp-server --version 2>&1", 1)
  end
end
