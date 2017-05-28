[ $(which softwareupdate 2>/dev/null) ] || return 0

# > softwareupdate --list --no-scan --force
# Software Update Tool
# 
# Software Update found the following new or updated software:
#    * macOS Sierra Update-10.12.5
#         macOS Sierra Update (10.12.5), 873261K [recommended] [restart]

# Scan number of leading asterisks for count of updates.
# Scan for ", (\d+[BKMGT])" to determine size.
# Scan for presence of "[recommended]" for critical updates.
# Scan for the presence of "[restart]" for interrupting changes.
# Describe how to install the update as a hint:
#   softareupdate
#   -l for list/details
#   -d download
#   -i install  -a | -r
# use entr for cache

