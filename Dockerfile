FROM quay.octanner.io/base/oct-erlang:elixir.0.1
COPY . /usr/src/
WORKDIR /usr/src/
RUN mix deps.get
EXPOSE 4000
CMD [ "mix", "phoenix.server" ]