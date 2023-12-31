FROM joshkeegan/zip:latest as zip
ADD "https://download.jetbrains.com/resharper/dotUltimate.2023.3/JetBrains.Rider.RemoteDebuggerUploads.linux-x64.2023.3.zip" ./2023.3.zip
RUN unzip -o ./2023.3.zip -d ./2023.3

FROM joedwards32/cs2
ADD https://download.jetbrains.com/rider/ssh-remote-debugging/linux-x64/jetbrains_debugger_agent_20230319.24.0 ./jetbrains_debugger_agent
USER root
RUN chmod +x ./jetbrains_debugger_agent
USER steam
COPY --from=zip ./2023.3/ /root/.local/share/JetBrains/RiderRemoteDebugger/2023.3/

RUN sed -i '/eval "\.\/cs2"/,/# Post Hook/c\echo "Running Debugger";sleep 500\n' ./entry.sh

