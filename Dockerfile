FROM quay.octanner.io/base/oct-erlang:elixir.0.1
RUN mkdir -p /usr/src/apps
WORKDIR /usr/src/app
COPY apps/service/* /usr/src/apps/service/
COPY apps/templater/* /usr/src/apps/templater/
COPY config/* /usr/config/
COPY deps/* /usr/deps/
RUN mix deps.get
EXPOSE 4000
CMD [ "mix", "phoenix.server" ]