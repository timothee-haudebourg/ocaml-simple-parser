open Unicode
open UString
open CodeMap

type error =
  | Unexpected of UChar.t option

exception Error of error Span.located

module Token : sig
  type t =
    | Terminal of Utf8String.t
    | NonTerminal of Utf8String.t

  val print : t -> Format.formatter -> unit
end

module TokenKind : sig
  type t =
    | Terminal
    | NonTerminal
    | Type
    | TypeIdent
    | Equal
    | RuleSeparator
    | Constructor

  val print : t -> Format.formatter -> unit
end

type token = Token.t

type token_kind = TokenKind.t

type t = token Span.located Seq.t
(** A lexer is a sequence of located tokens. *)

val create : UChar.t Seq.t -> token Span.located Seq.t
(** Create a lexer from an unicode character sequence. *)