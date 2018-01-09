(defproject transaction-tracker "0.1.0-SNAPSHOT"
  :description "FIXME: write this!"
  :url "http://example.com/FIXME"

  :dependencies [[org.clojure/clojure "1.5.1"]
                 [org.clojure/clojurescript "0.0-2234"]
                 [org.clojure/core.async "0.1.267.0-0d7780-alpha"]
                 [om "0.5.0"]]

  :plugins [[lein-cljsbuild "1.0.3"]]

  :source-paths ["src"]

  :cljsbuild {
    :builds [{:id "transaction-tracker"
              :source-paths ["src"]
              :compiler {
                :output-to "out/transaction_tracker.js"
                :output-dir "out"
                :optimizations :none
                :source-map true}}]})
