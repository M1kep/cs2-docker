FROM joedwards32/cs2

RUN sed -i '/eval "\.\/cs2"/,/# Post Hook/c\echo "Sleeping";sleep 200\n' ./entry.sh

