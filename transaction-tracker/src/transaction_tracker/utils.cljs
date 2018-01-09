(ns transaction-tracker.utils
  (:require [cljs.reader :as reader]
            [goog.string :as gstring]
            [goog.string.format :as gformat]))

(defn as-currency [amt]
  (str "$" (gstring/format "%.2f" amt)))
