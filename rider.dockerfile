FROM joedwards32/cs2
ADD https://download.jetbrains.com/rider/ssh-remote-debugging/linux-x64/jetbrains_debugger_agent_20230319.24.0 ./jetbrains_debugger_agent
ADD "https://data.services.jetbrains.com/products/download?code=RRD&platform=linux64" ./deps.zip

RUN sed -i '/eval "\.\/cs2"/,/# Post Hook/c\echo "Sleeping";sleep 200\n' ./entry.sh

