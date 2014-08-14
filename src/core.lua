local core = {
}

function core.isHelpOptionUsed(options)
    return options["h"] or options["help"]
end

function core.isVersionOptionUsed(options)
    return options["V"] or options["version"]
end

function core.isDryRunOptionUsed(options)
    return options["d"] or options["dry-run"]
end

function core.showHelp()
    print([[DocUnit version 0.0.1
    Usage:
        -d, --dry-run
         Do not run any tests, just print their names to standard output.

        -h, --help
         Print usage information and exit.

        -V, --version
         Print version information and exit.
    ]])
end

function core.showVersion()
    print("DocUnit version 0.0.1")
end

function core.performDryRun()
    -- TODO
end

return core

