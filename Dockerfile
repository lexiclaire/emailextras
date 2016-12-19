FROM quay.octanner.io/base/oct-erlang:elixer-1.3.4
COPY . /usr/src/
WORKDIR /usr/src/
RUN yes | mix local.hex 
RUN yes | mix local.rebar 
RUN mix deps.get
EXPOSE 4000
CMD [ "mix", "phoenix.server" ]